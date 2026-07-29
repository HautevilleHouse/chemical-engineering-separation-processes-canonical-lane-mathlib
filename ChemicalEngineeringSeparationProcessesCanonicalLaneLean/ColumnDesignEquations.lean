import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure DistillationColumnDesignPackage where
  numberOfStages : ℕ
  refluxRatio : ℝ
  feedStage : ℕ
  operatingLines : ℝ → ℝ
  equilibriumCurve : ℝ → ℝ
  mccabeThieleConstruction : Prop
  stageEfficiency : Prop

structure DistillationColumnDesignEvidence (D : DistillationColumnDesignPackage) where
  mccabeThieleConstructionClosed : D.mccabeThieleConstruction
  stageEfficiencyClosed : D.stageEfficiency

def DistillationColumnDesignClosed (D : DistillationColumnDesignPackage) : Prop :=
  D.mccabeThieleConstruction ∧ D.stageEfficiency

theorem distillation_column_design_closed_from_evidence
    (D : DistillationColumnDesignPackage) (E : DistillationColumnDesignEvidence D) :
    DistillationColumnDesignClosed D := by
  exact And.intro E.mccabeThieleConstructionClosed E.stageEfficiencyClosed

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
