package com.filipebrandao.busbudchallenge.ui.departurelist

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.SavedStateHandle
import com.filipebrandao.busbudchallenge.R
import com.filipebrandao.busbudchallenge.api.utils.RetrofitError
import com.filipebrandao.busbudchallenge.api.utils.SingleDisposable
import com.filipebrandao.busbudchallenge.common.utils.toHHMMFormat
import com.filipebrandao.busbudchallenge.domain.model.FetchDeparturesResult
import com.filipebrandao.busbudchallenge.domain.repository.departure.IDeparturesRepository
import com.filipebrandao.busbudchallenge.domain.usecase.FetchDeparturesUseCase
import com.filipebrandao.busbudchallenge.ui.base.BaseViewModel
import com.filipebrandao.busbudchallenge.ui.departurelist.model.DepartureUiModel
import com.filipebrandao.busbudchallenge.ui.departurelist.model.FetchDeparturesUiResult
import com.filipebrandao.busbudchallenge.utils.IResourceProvider
import com.filipebrandao.busbudchallenge.utils.ISchedulerProvider
import com.filipebrandao.busbudchallenge.utils.asPriceFloat
import org.threeten.bp.LocalDate
import org.threeten.bp.LocalDateTime

class DepartureListViewModel(
    private val savedStateHandle: SavedStateHandle,
    schedulerProvider: ISchedulerProvider,
    departuresRepository: IDeparturesRepository,
    private val resourcesProvider: IResourceProvider,
) : BaseViewModel() {

    companion object {
        private const val TAG = "DepartureListViewModel"
        private const val SAVED_DEPARTURES = "SAVED_DEPARTURES"
    }

    // the use case to fetch departures
    private val fetchDepartureUseCase = FetchDeparturesUseCase(
        departuresRepository,
        schedulerProvider.useCasesScheduler(),
        schedulerProvider.uiThreadScheduler()
    )

    // LiveData to hold the fetched departures
    private val _departures = MutableLiveData<FetchDeparturesUiResult>()

    // Expose a immutable LiveData field since the data can only be updated from within this class
    val departures: LiveData<FetchDeparturesUiResult> = _departures

    /**
     * Runs the use case to fetch departures and updated the exposed LiveData.
     */
    fun fetchDepartures(originGeohash: String, destinationGeohash: String, outboundDate: LocalDate, adults: Int) {

        // check if there's a saved state in case the app was killed in background
        savedStateHandle.get<FetchDeparturesUiResult>(SAVED_DEPARTURES)?.let {
            logger.d(TAG, "Restoring the previously saved state")
            _departures.value = it
            return
        }

        // run the use case to fetch departures from the server
        logger.d(TAG, "Fetching departures")

        val params = FetchDeparturesUseCase.Parameters(
            originGeohash = originGeohash,
            destinationGeohash = destinationGeohash,
            outboundDate = outboundDate,
            numberOfAdults = adults
        )

        fetchDepartureUseCase.execute(
            object : SingleDisposable<FetchDeparturesResult>() {
                override fun success(result: FetchDeparturesResult) {
                    logger.d(TAG, "Fetched %d departures successfully", result.departures.size)
                    // map to ui model and update LiveData
                    val uiResult = if (result.departures.isNotEmpty()) {
                        FetchDeparturesUiResult.Success(result.toUiModel(resourcesProvider))
                    } else {
                        FetchDeparturesUiResult.Error(null)
                    }

                    _departures.value = uiResult
                    savedStateHandle.set(SAVED_DEPARTURES, uiResult)
                }

                override fun error(error: RetrofitError) {
                    logger.e(TAG, "Failed to fetch stores")
                    // update LiveData with the error state
                    val uiResult = FetchDeparturesUiResult.Error(error.errorMessage)
                    _departures.value = uiResult
                    savedStateHandle.set(SAVED_DEPARTURES, uiResult)
                }
            }, params
        )

        addDisposable(fetchDepartureUseCase)
    }

    /**
     * Maps the Use Case result to Ui Model
     */
    private fun FetchDeparturesResult.toUiModel(resourcesProvider: IResourceProvider): List<DepartureUiModel> {
        val uiModels = mutableListOf<DepartureUiModel>()

        // map all departures
        this.departures.forEach { d ->
            uiModels.add(
                DepartureUiModel(
                    id = d.id,
                    operatorImageUrl = this.operators.first { it.id == d.operatorId }.logoUrl,
                    departureTime = LocalDateTime.parse(d.departureTime).toHHMMFormat(),
                    departureCity = this.cities.first { it.id == this.locations.first { it.id == d.originLocationId }.cityId }.name,
                    departureLocation = this.locations.firstOrNull { it.id == d.originLocationId }?.name,
                    arrivalTime = LocalDateTime.parse(d.arrivalTime).toHHMMFormat(),
                    arrivalCity = this.cities.first { it.id == this.locations.first { it.id == d.destinationLocationId }.cityId }.name,
                    arrivalLocation = this.locations.firstOrNull { it.id == d.destinationLocationId }?.name,
                    price = resourcesProvider.getString(R.string.price, d.prices.total.asPriceFloat())
                )
            )
        }

        return uiModels
    }
}