import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SeparationProcessSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure AdmittedSeparationObject where
  space : SeparationProcessSpace
  mixtureComponentCount : Nat
  thermodynamicConsistency : Prop
  transportModel : Prop
  separationEfficiency : Prop
  conclusion : separationEfficiency

structure SeparationEndgameState where
  object : AdmittedSeparationObject

def SeparationWitnessClosed (O : AdmittedSeparationObject) : Prop :=
  O.separationEfficiency

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
