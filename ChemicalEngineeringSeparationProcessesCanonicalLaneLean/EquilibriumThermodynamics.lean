import ChemicalEngineeringSeparationProcessesCanonicalLaneLean.MassTransferModels

/-!
# Equilibrium Thermodynamics Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure EquilibriumThermodynamicsPackage {G : PhaseEquilibriumPackage}
    {T : TemperatureProfilePackage G} (R : RaoultValidityPackage T) where
  gammaModelDefined : Prop
  excessGibbsComputed : Prop
  tieLineDetermined : Prop
  phaseStabilityChecked : Prop

structure EquilibriumThermodynamicsEvidence {G : PhaseEquilibriumPackage}
    {T : TemperatureProfilePackage G} {R : RaoultValidityPackage T}
    (E : EquilibriumThermodynamicsPackage R) where
  gammaModelDefinedClosed : E.gammaModelDefined
  excessGibbsComputedClosed : E.excessGibbsComputed
  tieLineDeterminedClosed : E.tieLineDetermined
  phaseStabilityCheckedClosed : E.phaseStabilityChecked

def EquilibriumThermodynamicsClosed {G : PhaseEquilibriumPackage}
    {T : TemperatureProfilePackage G} {R : RaoultValidityPackage T}
    (E : EquilibriumThermodynamicsPackage R) : Prop :=
  E.gammaModelDefined ∧ E.excessGibbsComputed ∧
  E.tieLineDetermined ∧ E.phaseStabilityChecked

theorem equilibrium_thermodynamics_closed_from_evidence
    {G : PhaseEquilibriumPackage} {T : TemperatureProfilePackage G}
    {R : RaoultValidityPackage T} (E : EquilibriumThermodynamicsPackage R)
    (Ev : EquilibriumThermodynamicsEvidence E) :
    EquilibriumThermodynamicsClosed E := by
  exact And.intro Ev.gammaModelDefinedClosed
    (And.intro Ev.excessGibbsComputedClosed
      (And.intro Ev.tieLineDeterminedClosed Ev.phaseStabilityCheckedClosed))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse