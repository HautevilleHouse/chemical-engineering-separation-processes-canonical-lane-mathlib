import HautevilleHouse.ChemicalEngineeringSeparationProcessesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure DistillationColumnModel where
  numberOfStages : Prop
  feedStageLocation : Prop
  refluxRatio : Prop
  vaporLiquidEquilibrium : Prop
  massBalanceClosure : Prop
  energyBalanceClosure : Prop

structure DistillationColumnEvidence (D : DistillationColumnModel) where
  numberOfStagesClosed : D.numberOfStages
  feedStageLocationClosed : D.feedStageLocation
  refluxRatioClosed : D.refluxRatio
  vaporLiquidEquilibriumClosed : D.vaporLiquidEquilibrium
  massBalanceClosureClosed : D.massBalanceClosure
  energyBalanceClosureClosed : D.energyBalanceClosure

def DistillationColumnClosed (D : DistillationColumnModel) : Prop :=
  D.numberOfStages ∧ D.feedStageLocation ∧ D.refluxRatio ∧
  D.vaporLiquidEquilibrium ∧ D.massBalanceClosure ∧ D.energyBalanceClosure

theorem distillation_column_closed_from_evidence (D : DistillationColumnModel)
    (E : DistillationColumnEvidence D) : DistillationColumnClosed D := by
  exact And.intro E.numberOfStagesClosed
    (And.intro E.feedStageLocationClosed
      (And.intro E.refluxRatioClosed
        (And.intro E.vaporLiquidEquilibriumClosed
          (And.intro E.massBalanceClosureClosed E.energyBalanceClosureClosed))))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse