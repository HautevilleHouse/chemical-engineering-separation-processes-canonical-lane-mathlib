import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure VaporLiquidEquilibriumPackage where
  temperature : ℝ
  pressure : ℝ
  liquidComposition : ℝ → ℝ
  vaporComposition : ℝ → ℝ
  kValues : ℝ → ℝ
  relativeVolatilities : ℝ → ℝ
  equilibriumRatios : Prop
  phaseEnvelope : Prop

structure VaporLiquidEquilibriumEvidence (V : VaporLiquidEquilibriumPackage) where
  equilibriumRatiosClosed : V.equilibriumRatios
  phaseEnvelopeClosed : V.phaseEnvelope

def VaporLiquidEquilibriumClosed (V : VaporLiquidEquilibriumPackage) : Prop :=
  V.equilibriumRatios ∧ V.phaseEnvelope

theorem vapor_liquid_equilibrium_closed_from_evidence
    (V : VaporLiquidEquilibriumPackage) (E : VaporLiquidEquilibriumEvidence V) :
    VaporLiquidEquilibriumClosed V := by
  exact And.intro E.equilibriumRatiosClosed E.phaseEnvelopeClosed

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
