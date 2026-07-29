import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure DistillationColumnDesignPackage (A : AdmissibleClass) where
  feedConditions : Prop
  numberTheoreticalStages : Prop
  minimumReflux : Prop
  columnDiameter : Prop
  trayHydraulics : Prop

structure DistillationColumnDesignEvidence (A : AdmissibleClass) (P : DistillationColumnDesignPackage A) where
  feedConditionsClosed : P.feedConditions
  numberTheoreticalStagesClosed : P.numberTheoreticalStages
  minimumRefluxClosed : P.minimumReflux
  columnDiameterClosed : P.columnDiameter
  trayHydraulicsClosed : P.trayHydraulics

def DistillationColumnDesignClosed (A : AdmissibleClass) (P : DistillationColumnDesignPackage A) : Prop :=
  P.feedConditions ∧ P.numberTheoreticalStages ∧ P.minimumReflux ∧ P.columnDiameter ∧ P.trayHydraulics

theorem distillation_column_design_closed_from_evidence (A : AdmissibleClass) (P : DistillationColumnDesignPackage A)
    (E : DistillationColumnDesignEvidence A P) : DistillationColumnDesignClosed A P := by
  exact And.intro E.feedConditionsClosed (And.intro E.numberTheoreticalStagesClosed (And.intro E.minimumRefluxClosed (And.intro E.columnDiameterClosed E.trayHydraulicsClosed)))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse