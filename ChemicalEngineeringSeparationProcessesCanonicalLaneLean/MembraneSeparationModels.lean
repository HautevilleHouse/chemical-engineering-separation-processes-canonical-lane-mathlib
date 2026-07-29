import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure MembraneSeparationPackage where
  membranePermeability : ℝ → ℝ
  selectivity : ℝ
  drivingForceModel : Prop
  fluxModel : ℝ → ℝ
  solutionDiffusion : Prop
  poreFlowModel : Prop

structure MembraneSeparationEvidence (M : MembraneSeparationPackage) where
  solutionDiffusionClosed : M.solutionDiffusion
  poreFlowModelClosed : M.poreFlowModel

def MembraneSeparationClosed (M : MembraneSeparationPackage) : Prop :=
  M.solutionDiffusion ∧ M.poreFlowModel

theorem membrane_separation_closed_from_evidence
    (M : MembraneSeparationPackage) (E : MembraneSeparationEvidence M) :
    MembraneSeparationClosed M := by
  exact And.intro E.solutionDiffusionClosed E.poreFlowModelClosed

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
