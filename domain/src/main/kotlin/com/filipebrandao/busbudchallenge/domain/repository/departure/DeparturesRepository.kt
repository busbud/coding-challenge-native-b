package com.filipebrandao.busbudchallenge.domain.repository.departure

import com.filipebrandao.busbudchallenge.api.models.responses.PollResponseDto
import com.filipebrandao.busbudchallenge.api.models.responses.SearchResponseDto
import com.filipebrandao.busbudchallenge.api.services.IBusbudService
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import com.filipebrandao.busbudchallenge.common.utils.toServerFormat
import io.reactivex.rxjava3.core.Single
import org.threeten.bp.LocalDate


/**
 * The Departures Repository.
 * Quite anemic but let's just pretend for the sake of showing off some good architectural patterns/practices. I'll skip the DataSources and their mediation here, though.
 * In a more complex project the methods here would return Business Logic Models instead of the DTOs... Let's skip that as well.
 */
class DeparturesRepository(
    private val busbudService: IBusbudService,
    private val logger: ILogger
) : IDeparturesRepository {

    companion object {
        private const val TAG = "DeparturesRepository"
    }

    override fun search(
        originGeohash: String,
        destinationGeohash: String,
        outboundDate: LocalDate,
        numberOfAdults: Int
    ): Single<SearchResponseDto> {
        logger.d(TAG, "Searching departures from %s to %s at %s for %d adult(s)", originGeohash, destinationGeohash, outboundDate, numberOfAdults)
        return busbudService.search(originGeohash, destinationGeohash, outboundDate.toServerFormat(), numberOfAdults)
    }

    /**
     * Chains poll requests until complete and returns a list with all the responses
     */
    override fun poll(
        originGeohash: String,
        destinationGeohash: String,
        outboundDate: LocalDate,
        numberOfAdults: Int,
        startIndex: Int
    ): Single<List<PollResponseDto>> {
        // incrementer for the start index for each poll request
        var currentIndex = startIndex

        return Single.defer {
            logger.d(TAG, "Polling departures from %s to %s at %s for %d adult(s) [%d]", originGeohash, destinationGeohash, outboundDate, numberOfAdults, currentIndex)
            busbudService.poll(originGeohash, destinationGeohash, outboundDate.toServerFormat(), numberOfAdults, currentIndex)
        }.doOnSuccess {
            logger.d(TAG, "Polling returned %d departures with complete state = %b", it.departures.size, it.complete)
            currentIndex += it.departures.size
        }
            .repeat()
            .takeUntil { it.complete }
            // flowable back to single
            .toList()
    }
}
