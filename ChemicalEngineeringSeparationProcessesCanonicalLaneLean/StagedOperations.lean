import ChemicalEngineeringSeparationProcessesCanonicalLaneLean.EquilibriumThermodynamics

/-!
# Staged Operations Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure StagedOperationsPackage {G : PhaseEquilibriumPackage}
    {T : TemperatureProfilePackage G} {R : RaoultValidityPackage T}
    {E : EquilibriumThermodynamicsPackage R} (S : StageEfficiencyPackage E) where
  numberOfStagesDetermined : Prop
  feedStageLocation : Prop
  operatingLineConstructed : Prop
  stagewiseMassBalances : Prop

structure StagedOperationsEvidence {G : PhaseEquilibriumPackage}
    {T : TemperatureProfilePackage G} {R : RaoultValidityPackage T}
    {E : EquilibriumThermodynamicsPackage R} {S : StageEfficiencyPackage E}
    (O : StagedOperationsPackage S) where
  numberOfStagesDeterminedClosed : O.numberOfStagesDetermined
  feedStageLocationClosed : O.feedStageLocation
  operatingLineConstructedClosed : O.operatingLineConstructed
  stagewiseMassBalancesClosed : O.stagewiseMassBalances

def StagedOperationsClosed {G : PhaseEquilibriumPackage}
    {T : TemperatureProfilePackage G} {R : RaoultValidityPackage T}
    {E : EquilibriumThermodynamicsPackage R} {S : StageEfficiencyPackage E}
    (O : StagedOperationsPackage S) : Prop :=
  O.numberOfStagesDetermined ∧ O.feedStageLocation ∧
  O.operatingLineConstructed ∧ O.stagewiseMassBalances

theorem staged_operations_closed_from_evidence
    {G : PhaseEquilibriumPackage} {T : TemperatureProfilePackage G}
    {R : RaoultValidityPackage T} {E : EquilibriumThermodynamicsPackage R}
    {S : StageEfficiencyPackage E} (O : StagedOperationsPackage S)
    (Ev : StagedOperationsEvidence O) : StagedOperationsClosed O := by
  exact And.intro Ev.numberOfStagesDeterminedClosed
    (And.intro Ev.feedStageLocationClosed
      (And.intro Ev.operatingLineConstructedClosed Ev.stagewiseMassBalancesClosed))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse