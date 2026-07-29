import HautevilleHouse.ChemicalEngineeringSeparationProcessesCanonicalLaneLean.MassTransferPDE

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure PhaseEquilibriumThermoModel {D : DistillationColumnModel}
    (M : MassTransferPDEModel D) where
  fugacityCoefficientModel : Prop
  activityCoefficientModel : Prop
  equilibriumRatioCorrelation : Prop
  enthalpyModel : Prop
  thermodynamicConsistency : Prop

structure PhaseEquilibriumThermoEvidence {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} (T : PhaseEquilibriumThermoModel M) where
  fugacityCoefficientModelClosed : T.fugacityCoefficientModel
  activityCoefficientModelClosed : T.activityCoefficientModel
  equilibriumRatioCorrelationClosed : T.equilibriumRatioCorrelation
  enthalpyModelClosed : T.enthalpyModel
  thermodynamicConsistencyClosed : T.thermodynamicConsistency

def PhaseEquilibriumThermoClosed {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} (T : PhaseEquilibriumThermoModel M) : Prop :=
  T.fugacityCoefficientModel ∧ T.activityCoefficientModel ∧
  T.equilibriumRatioCorrelation ∧ T.enthalpyModel ∧ T.thermodynamicConsistency

theorem phase_equilibrium_thermo_closed_from_evidence {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} (T : PhaseEquilibriumThermoModel M)
    (E : PhaseEquilibriumThermoEvidence T) : PhaseEquilibriumThermoClosed T := by
  exact And.intro E.fugacityCoefficientModelClosed
    (And.intro E.activityCoefficientModelClosed
      (And.intro E.equilibriumRatioCorrelationClosed
        (And.intro E.enthalpyModelClosed E.thermodynamicConsistencyClosed)))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse