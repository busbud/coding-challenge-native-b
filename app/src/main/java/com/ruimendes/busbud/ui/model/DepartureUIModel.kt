package com.ruimendes.busbud.ui.model

data class DepartureUIModel(
    val operatorLogoUrl: String,
    val departureTime: String,
    val arrivalTime: String,
    val departureName: String,
    val arrivalName: String,
    val price: String
)