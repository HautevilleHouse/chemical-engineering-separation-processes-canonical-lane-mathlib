import HautevilleHouse.ChemicalEngineeringSeparationProcessesCanonicalLaneLean.PhaseEquilibriumThermo

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure SeparationProcessDesignModel {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} (T : PhaseEquilibriumThermoModel M) where
  designSpecifications : Prop
  costObjective : Prop
  environmentalConstraints : Prop
  operabilityConstraints : Prop

structure SeparationProcessDesignEvidence {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} {T : PhaseEquilibriumThermoModel M}
    (S : SeparationProcessDesignModel T) where
  designSpecificationsClosed : S.designSpecifications
  costObjectiveClosed : S.costObjective
  environmentalConstraintsClosed : S.environmentalConstraints
  operabilityConstraintsClosed : S.operabilityConstraints

def SeparationProcessDesignClosed {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} {T : PhaseEquilibriumThermoModel M}
    (S : SeparationProcessDesignModel T) : Prop :=
  S.designSpecifications ∧ S.costObjective ∧
  S.environmentalConstraints ∧ S.operabilityConstraints

theorem separation_process_design_closed_from_evidence {D : DistillationColumnModel}
    {M : MassTransferPDEModel D} {T : PhaseEquilibriumThermoModel M}
    (S : SeparationProcessDesignModel T) (E : SeparationProcessDesignEvidence S) :
    SeparationProcessDesignClosed S := by
  exact And.intro E.designSpecificationsClosed
    (And.intro E.costObjectiveClosed
      (And.intro E.environmentalConstraintsClosed E.operabilityConstraintsClosed))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse