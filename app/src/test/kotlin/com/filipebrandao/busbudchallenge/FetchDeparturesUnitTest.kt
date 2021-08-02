package com.filipebrandao.busbudchallenge

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import androidx.lifecycle.SavedStateHandle
import com.filipebrandao.busbudchallenge.api.INetworkLayer
import com.filipebrandao.busbudchallenge.api.NetworkLayer
import com.filipebrandao.busbudchallenge.api.models.responses.PollResponseDto
import com.filipebrandao.busbudchallenge.api.models.responses.SearchResponseDto
import com.filipebrandao.busbudchallenge.api.services.IBusbudService
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import com.filipebrandao.busbudchallenge.common.logging.TestLogger
import com.filipebrandao.busbudchallenge.common.utils.toServerFormat
import com.filipebrandao.busbudchallenge.di.NetworkExternalValues
import com.filipebrandao.busbudchallenge.domain.repository.departure.DeparturesRepository
import com.filipebrandao.busbudchallenge.domain.repository.departure.IDeparturesRepository
import com.filipebrandao.busbudchallenge.ui.departurelist.DepartureListViewModel
import com.filipebrandao.busbudchallenge.ui.departurelist.model.FetchDeparturesUiResult
import com.filipebrandao.busbudchallenge.utils.IResourceProvider
import com.filipebrandao.busbudchallenge.utils.ISchedulerProvider
import com.filipebrandao.busbudchallenge.utils.JSONUtils
import com.filipebrandao.busbudchallenge.utils.TestSchedulerProvider
import com.filipebrandao.busbudchallenge.utils.getOrAwaitValue
import io.mockk.Called
import io.mockk.every
import io.mockk.mockk
import io.mockk.spyk
import io.mockk.verifySequence
import io.reactivex.rxjava3.core.Single
import okhttp3.ResponseBody
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestRule
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.context.startKoin
import org.koin.core.context.stopKoin
import org.koin.dsl.module
import org.koin.test.KoinTest
import org.koin.test.inject
import org.threeten.bp.LocalDate
import retrofit2.Response
import kotlin.test.assertIs

class FetchDeparturesUnitTest : KoinTest {

    companion object {
        // inputs
        private const val ORIGIN_GEOHASH = "f2m673"
        private const val DESTINATION_GEOHASH = "f25dvk"
        private val OUTBOUND_DATE = LocalDate.of(2021, 8, 28)
        private const val NUMBER_OF_ADULTS = 1

        private const val DEPARTURES_AFTER_SEARCH = 3
        private const val DEPARTURES_AFTER_FIRST_POLL = 5

        // outputs
        private const val TOTAL_DEPARTURES_2_POLL = 6
        private const val TOTAL_DEPARTURES_NO_POLL = 3

        // json files to mock the network layer with
        private const val JSON_SEARCH_RESPONSE_NOT_COMPLETE = "search_response_not_complete.json"
        private const val JSON_POLL_RESPONSE_NOT_COMPLETE = "poll_response_not_complete.json"
        private const val JSON_POLL_RESPONSE_COMPLETE = "poll_response_complete.json"
        private const val JSON_SEARCH_RESPONSE_COMPLETE = "search_response_complete.json"
    }

    // mock the main looper because of livedata
    @Rule
    @JvmField
    val rule: TestRule = InstantTaskExecutorRule()

    // di environment definition
    private val testModules = module {
        // utils
        single<ILogger> { TestLogger() }
        single<ISchedulerProvider> { TestSchedulerProvider() }
        single<IResourceProvider> {
            object : IResourceProvider {
                override fun getString(resId: Int) = "irrelevant"
                override fun getString(resId: Int, vararg args: Any) = "irrelevant"
            }
        }

        // network layer
        single<INetworkLayer> {
            NetworkLayer(
                externalValues = NetworkExternalValues(),
                logger = get()
            )
        }
        single<IBusbudService> {
            // spy into the mocked BusbudService to verify which methods were called
            spyk(mockk<IBusbudService>())
        }

        // domain layer
        single<IDeparturesRepository> { DeparturesRepository(busbudService = get(), logger = get()) }

        // presentation layer
        viewModel {
            DepartureListViewModel(
                schedulerProvider = get(),
                departuresRepository = get(),
                resourcesProvider = get(),
                savedStateHandle = SavedStateHandle()
            )
        }

    }

    private val busbudService by inject<IBusbudService>()
    private val viewModel by inject<DepartureListViewModel>()

    @Before
    fun before() {
        startKoin {
            modules(testModules)
        }
    }

    @After
    fun after() {
        stopKoin()
    }

    @Test
    fun `fetch departures with two poll requests`() {
        // GIVEN
        // mock network service responses:
        // search call will return 3 departures , 1 operator and complete = false
        every { busbudService.search(any(), any(), any(), any()) } returns Single.just(JSONUtils.parseJsonFromFile(JSON_SEARCH_RESPONSE_NOT_COMPLETE, SearchResponseDto::class.java))
        // first poll call will return 2 departures , the same operator and complete = false
        every { busbudService.poll(any(), any(), any(), any(), DEPARTURES_AFTER_SEARCH) } returns Single.just(JSONUtils.parseJsonFromFile(JSON_POLL_RESPONSE_NOT_COMPLETE, PollResponseDto::class.java))
        // second poll call will return 1 departure , the same operator and complete = true
        every { busbudService.poll(any(), any(), any(), any(), DEPARTURES_AFTER_FIRST_POLL) } returns Single.just(JSONUtils.parseJsonFromFile(JSON_POLL_RESPONSE_COMPLETE, PollResponseDto::class.java))

        // WHEN
        val departuresResult = fetchDeparturesFromViewModel()

        // THEN
        // assert that the use case was successful
        assertIs<FetchDeparturesUiResult.Success>(departuresResult)
        // the total departures returned
        assertEquals(TOTAL_DEPARTURES_2_POLL, departuresResult.departures.size)

        // ensure the sequence of methods called in the network service for the expected inputs it was called with
        verifySequence {
            busbudService.search(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE.toServerFormat(), NUMBER_OF_ADULTS)
            busbudService.poll(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE.toServerFormat(), NUMBER_OF_ADULTS, DEPARTURES_AFTER_SEARCH)
            busbudService.poll(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE.toServerFormat(), NUMBER_OF_ADULTS, DEPARTURES_AFTER_FIRST_POLL)
        }
    }

    private fun fetchDeparturesFromViewModel(): FetchDeparturesUiResult {
        // trigger the viewmodel to fetch departures
        viewModel.fetchDepartures(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE, NUMBER_OF_ADULTS)

        // wait for the exposed LiveData field to be populated
        viewModel.departures.getOrAwaitValue()

        return viewModel.departures.value!!
    }

    /**
     * Using junit theories/parametrized tests would be cool because most of the code is repeated but the verifySequence isn't reusable :(
     */
    @Test
    fun `fetch departures with no poll requests`() {
        // GIVEN
        // mock network service responses:
        // search call will return 3 departures , 1 operator and complete = true
        every { busbudService.search(any(), any(), any(), any()) } returns Single.just(JSONUtils.parseJsonFromFile(JSON_SEARCH_RESPONSE_COMPLETE, SearchResponseDto::class.java))

        // WHEN
        val departuresResult = fetchDeparturesFromViewModel()

        // THEN
        // assert that the use case was successful
        assertIs<FetchDeparturesUiResult.Success>(departuresResult)
        // the total departures returned
        assertEquals(TOTAL_DEPARTURES_NO_POLL, departuresResult.departures.size)

        // ensure the sequence of methods called in the network service for the expected inputs it was called with
        verifySequence {
            busbudService.search(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE.toServerFormat(), NUMBER_OF_ADULTS)
            busbudService.poll(any(), any(), any(), any(), any()) wasNot Called
        }
    }

    @Test
    fun `fetch departures throws http error`() {
        // GIVEN
        // mock network service responses:
        // search call will return 3 departures , 1 operator and complete = true
        every { busbudService.search(any(), any(), any(), any()) } returns Single.just(JSONUtils.parseJsonFromFile(JSON_SEARCH_RESPONSE_NOT_COMPLETE, SearchResponseDto::class.java))
        // first poll call will throw an error
        every { busbudService.poll(any(), any(), any(), any(), DEPARTURES_AFTER_SEARCH) } throws retrofit2.HttpException(mockErrorResponse())

        // WHEN
        val departuresResult = fetchDeparturesFromViewModel()

        // THEN
        // assert that the use case was not successful
        assertIs<FetchDeparturesUiResult.Error>(departuresResult)

        // ensure the sequence of methods called in the network service for the expected inputs it was called with
        verifySequence {
            busbudService.search(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE.toServerFormat(), NUMBER_OF_ADULTS)
            busbudService.poll(any(), any(), any(), any(), DEPARTURES_AFTER_SEARCH)
        }
    }

    private fun mockErrorResponse() = Response.error<PollResponseDto>(
        500,
        mockk<ResponseBody>().apply {
            every { contentType() } returns mockk()
            every { contentLength() } returns 0
            every { string() } returns ""
        }
    )

}