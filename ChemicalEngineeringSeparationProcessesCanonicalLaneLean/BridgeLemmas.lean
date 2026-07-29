import ChemicalEngineeringSeparationProcessesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SeparationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse