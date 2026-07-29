import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure SeparationAdmittedObject where
  feedComposition : Prop
  separationFactor : Prop
  equilibriumModel : Prop
  massTransferKinetics : Prop
  conclusion : feedComposition ∧ separationFactor ∧ equilibriumModel ∧ massTransferKinetics

structure AdmissibleClass where
  object : SeparationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse