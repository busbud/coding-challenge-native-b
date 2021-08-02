package com.filipebrandao.busbudchallenge.ui.base

import androidx.lifecycle.ViewModel
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import com.filipebrandao.busbudchallenge.domain.usecase.base.BaseReactiveUseCase
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

open class BaseViewModel : ViewModel(), KoinComponent {
    protected val logger: ILogger by inject()

    // tracks executed [BaseReactiveUseCase]'s in order to dispose them
    private val executedReactiveUseCases = mutableListOf<BaseReactiveUseCase>()

    protected fun addDisposable(useCase: BaseReactiveUseCase) {
        executedReactiveUseCases.add(useCase)
    }

    override fun onCleared() {
        logger.v(javaClass.simpleName, "onCleared")
        super.onCleared()
        disposeReactiveUseCases()
    }

    private fun disposeReactiveUseCases() {
        executedReactiveUseCases.iterator().let { iterator ->
            while (iterator.hasNext()) {
                iterator.next().let { useCase ->
                    useCase.dispose()
                    iterator.remove()
                }
            }
        }
    }
}