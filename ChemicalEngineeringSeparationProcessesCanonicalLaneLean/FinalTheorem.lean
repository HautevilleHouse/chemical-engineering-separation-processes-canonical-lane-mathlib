import canonicalLaneMathlib.AdmissibleClass
import cpChemicalEngineeringSeparationProcesses
import PhaseEquilibrium
import MassTransfer
import UnitOperations

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcesses

def ConstrainedSeparationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_separation_endgame (A : AdmissibleClass) :
    ConstrainedSeparationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringSeparationProcesses
end HautevilleHouse