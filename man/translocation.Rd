% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/population_modification-functions.R
\name{translocation}
\alias{translocation}
\title{Translocate populations}
\usage{
translocation(
  origins_layer,
  destinations_layer,
  stages = NULL,
  effect_timesteps = 1
)
}
\arguments{
\item{origins_layer}{the name of a spatial layer in the landscape object with the locations
and number of individuals to translocate from. Note, this layer will have only zero
values if individuals are being introduced from outside the study area}

\item{destinations_layer}{the name of a spatial layer in the landscape object with the locations
and number of individuals to translocate to. Note, this layer will have only zero
values if individuals are being controlled (e.g. culling)}

\item{stages}{which life-stages are modified - default is all}

\item{effect_timesteps}{which timesteps in a single simulation do the translocations
take place}
}
\description{
This function is used to move or introduce populations throughout a simulation. A user can
specify which life-stages will be affected (default is all) and in which timesteps the
translocations will take place. A warning will be generated if populations are not available
where specified to translocate from.
}
\examples{

# Modify populations in all life-stages using explicit layers of origin and destination populations
# in timesteps 5, 10, and 15.

\dontrun{
trans_pop <- translocation(origins_layer = "origins",
                           destinations_layer = "destinations",
                           stages = NULL,
                           effect_timesteps = c(5, 10, 15))

ls <- landscape(population = egk_pop,
                suitability = NULL,
                carrying_capacity = NULL,
                "origins" = egk_origins,
                "destinations" = egk_destinations)

pd <- population_dynamics(change = growth(egk_mat), modification = trans_pop)

simulation(landscape = ls, population_dynamics = pd, habitat_dynamics = NULL, timesteps = 20)
}
}
