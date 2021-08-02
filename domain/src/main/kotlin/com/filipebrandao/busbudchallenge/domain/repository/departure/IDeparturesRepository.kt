package com.filipebrandao.busbudchallenge.domain.repository.departure

import com.filipebrandao.busbudchallenge.api.models.responses.PollResponseDto
import com.filipebrandao.busbudchallenge.api.models.responses.SearchResponseDto
import io.reactivex.rxjava3.core.Single
import org.threeten.bp.LocalDate

interface IDeparturesRepository {

    fun search(
        originGeohash: String,
        destinationGeohash: String,
        outboundDate: LocalDate,
        numberOfAdults: Int
    ): Single<SearchResponseDto>

    /**
     * Chains poll requests until complete and returns a list with all the responses
     */
    fun poll(
        originGeohash: String,
        destinationGeohash: String,
        outboundDate: LocalDate,
        numberOfAdults: Int,
        startIndex: Int
    ): Single<List<PollResponseDto>>
}
