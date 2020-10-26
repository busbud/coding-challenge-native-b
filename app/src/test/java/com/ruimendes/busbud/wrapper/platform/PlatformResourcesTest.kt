package com.ruimendes.busbud.wrapper.platform

import android.content.Context
import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.whenever
import org.junit.Assert.*
import org.junit.Test

class PlatformResourcesTest {

    private val context = mock<Context>()
    private val resources = PlatformResources(context)

    @Test
    fun `test getStringResource returns expected string`() {

        val identifier = 123
        val expected = "string from context"
        whenever(context.getString(identifier)).thenReturn(expected)

        assertEquals(resources.getStringResource(identifier), expected)
    }
}