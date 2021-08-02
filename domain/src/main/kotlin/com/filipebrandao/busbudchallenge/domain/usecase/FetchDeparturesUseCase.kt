package com.filipebrandao.busbudchallenge.domain.usecase

import com.filipebrandao.busbudchallenge.api.models.responses.PollResponseDto
import com.filipebrandao.busbudchallenge.api.models.responses.SearchResponseDto
import com.filipebrandao.busbudchallenge.common.utils.toServerFormat
import com.filipebrandao.busbudchallenge.domain.model.FetchDeparturesResult
import com.filipebrandao.busbudchallenge.domain.repository.departure.IDeparturesRepository
import com.filipebrandao.busbudchallenge.domain.usecase.FetchDeparturesUseCase.Parameters
import com.filipebrandao.busbudchallenge.domain.usecase.base.SingleUseCase
import io.reactivex.rxjava3.core.Scheduler
import io.reactivex.rxjava3.core.Single
import org.threeten.bp.LocalDate

/**
 * Fetches departures from the DeparturesRepository which fetches from the remote server.
 * Mediates poll requests when needed.
 */
class FetchDeparturesUseCase(
    private val departuresRepository: IDeparturesRepository,
    executionScheduler: Scheduler,
    postExecutionScheduler: Scheduler
) : SingleUseCase<FetchDeparturesResult, Parameters>(executionScheduler, postExecutionScheduler) {

    companion object {
        private const val TAG = "FetchDeparturesUseCase"
    }

    override fun buildUseCaseSingle(params: Parameters?): Single<FetchDeparturesResult> {
        logger.d(TAG, "Searching departures from %s to %s at %s for %d adult(s)", params!!.originGeohash, params.destinationGeohash, params.outboundDate.toServerFormat(), params.numberOfAdults)

        return departuresRepository.search(params.originGeohash, params.destinationGeohash, params.outboundDate, params.numberOfAdults)
            .flatMap { searchResponse ->
                logger.d(TAG, "Fetched %d departures", searchResponse.departures.size)

                return@flatMap if (searchResponse.complete) {
                    // no need for more request, just return the results from the search request
                    Single.just(searchResponse.mapToFetchDeparturesResult())
                } else {
                    // do poll requests until complete
                    departuresRepository.poll(params.originGeohash, params.destinationGeohash, params.outboundDate, params.numberOfAdults, startIndex = searchResponse.departures.size)
                        .map { pollResponses ->
                            // merge search and poll responses into a single result
                            val result: FetchDeparturesResult = searchResponse.mapToFetchDeparturesResult()
                            result.add(pollResponses.mapToFetchDeparturesResult())
                            result
                        }
                }
            }
    }

    private fun SearchResponseDto.mapToFetchDeparturesResult() = FetchDeparturesResult(departures.toHashSet(), operators.toHashSet(), locations.toHashSet(), cities.toHashSet())

    private fun List<PollResponseDto>.mapToFetchDeparturesResult(): FetchDeparturesResult {
        return FetchDeparturesResult().apply {
            forEach {
                departures.addAll(it.departures)
                operators.addAll(it.operators)
            }
        }
    }

    data class Parameters(
        val originGeohash: String,
        val destinationGeohash: String,
        val outboundDate: LocalDate,
        val numberOfAdults: Int
    )
}
