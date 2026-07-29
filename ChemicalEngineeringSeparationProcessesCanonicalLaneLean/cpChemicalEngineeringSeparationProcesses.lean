import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcesses

structure CpPackage where
  heatCapacity : Type u
  temperatureDependence : Prop
  isobaric : Prop
  enthalpiesDerived : Prop

structure CpEvidence (C : CpPackage) where
  temperatureDependenceClosed : C.temperatureDependence
  isobaricClosed : C.isobaric
  enthalpiesDerivedClosed : C.enthalpiesDerived

def CpClosed (C : CpPackage) : Prop := C.temperatureDependence ∧ C.isobaric ∧ C.enthalpiesDerived

theorem cp_closed_from_evidence (C : CpPackage) (E : CpEvidence C) : CpClosed C := by
  exact And.intro E.temperatureDependenceClosed (And.intro E.isobaricClosed E.enthalpiesDerivedClosed)

end ChemicalEngineeringSeparationProcesses
end HautevilleHouse