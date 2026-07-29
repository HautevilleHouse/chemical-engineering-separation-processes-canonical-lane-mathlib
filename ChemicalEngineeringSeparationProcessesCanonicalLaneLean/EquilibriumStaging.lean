import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure EquilibriumStagingPackage (A : AdmissibleClass) where
  vaporLiquidEquilibrium : Prop
  operatingLine : Prop
  stageEfficiency : Prop
  refluxRatio : Prop

structure EquilibriumStagingEvidence (A : AdmissibleClass) (P : EquilibriumStagingPackage A) where
  vaporLiquidEquilibriumClosed : P.vaporLiquidEquilibrium
  operatingLineClosed : P.operatingLine
  stageEfficiencyClosed : P.stageEfficiency
  refluxRatioClosed : P.refluxRatio

def EquilibriumStagingClosed (A : AdmissibleClass) (P : EquilibriumStagingPackage A) : Prop :=
  P.vaporLiquidEquilibrium ∧ P.operatingLine ∧ P.stageEfficiency ∧ P.refluxRatio

theorem equilibrium_staging_closed_from_evidence (A : AdmissibleClass) (P : EquilibriumStagingPackage A)
    (E : EquilibriumStagingEvidence A P) : EquilibriumStagingClosed A P := by
  exact And.intro E.vaporLiquidEquilibriumClosed (And.intro E.operatingLineClosed (And.intro E.stageEfficiencyClosed E.refluxRatioClosed))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse