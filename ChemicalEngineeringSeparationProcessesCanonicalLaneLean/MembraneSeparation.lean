import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure MembraneSeparationPackage (A : AdmissibleClass) where
  solutionDiffusionModel : Prop
  poreFlowModel : Prop
  selectivity : Prop
  permeability : Prop
  foulingMechanism : Prop

structure MembraneSeparationEvidence (A : AdmissibleClass) (P : MembraneSeparationPackage A) where
  solutionDiffusionModelClosed : P.solutionDiffusionModel
  poreFlowModelClosed : P.poreFlowModel
  selectivityClosed : P.selectivity
  permeabilityClosed : P.permeability
  foulingMechanismClosed : P.foulingMechanism

def MembraneSeparationClosed (A : AdmissibleClass) (P : MembraneSeparationPackage A) : Prop :=
  P.solutionDiffusionModel ∧ P.poreFlowModel ∧ P.selectivity ∧ P.permeability ∧ P.foulingMechanism

theorem membrane_separation_closed_from_evidence (A : AdmissibleClass) (P : MembraneSeparationPackage A)
    (E : MembraneSeparationEvidence A P) : MembraneSeparationClosed A P := by
  exact And.intro E.solutionDiffusionModelClosed (And.intro E.poreFlowModelClosed (And.intro E.selectivityClosed (And.intro E.permeabilityClosed E.foulingMechanismClosed)))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse