import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcesses

structure UnitOperationsPackage where
  distillationColumn : Prop
  absorptionTower : Prop
  extractionUnit : Prop
  membraneModule : Prop
  crystallizationUnit : Prop

structure UnitOperationsEvidence (U : UnitOperationsPackage) where
  distillationColumnClosed : U.distillationColumn
  absorptionTowerClosed : U.absorptionTower
  extractionUnitClosed : U.extractionUnit
  membraneModuleClosed : U.membraneModule
  crystallizationUnitClosed : U.crystallizationUnit

def UnitOperationsClosed (U : UnitOperationsPackage) : Prop :=
  U.distillationColumn ∧ U.absorptionTower ∧ U.extractionUnit ∧
  U.membraneModule ∧ U.crystallizationUnit

theorem unit_operations_closed_from_evidence (U : UnitOperationsPackage) (E : UnitOperationsEvidence U) :
  UnitOperationsClosed U := by
  exact And.intro E.distillationColumnClosed
    (And.intro E.absorptionTowerClosed
      (And.intro E.extractionUnitClosed
        (And.intro E.membraneModuleClosed E.crystallizationUnitClosed)))

end ChemicalEngineeringSeparationProcesses
end HautevilleHouse