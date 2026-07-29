import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcesses

structure PhaseEquilibriumPackage where
  vaporLiquidEquilibrium : Prop
  activityCoefficientModel : Type u
  fugacityCoefficientModel : Type v
  equilibriumCondition : Prop
  ptFlashSolver : Prop

structure PhaseEquilibriumEvidence (P : PhaseEquilibriumPackage) where
  vaporLiquidEquilibriumClosed : P.vaporLiquidEquilibrium
  activityCoefficientModelClosed : P.activityCoefficientModel
  fugacityCoefficientModelClosed : P.fugacityCoefficientModel
  equilibriumConditionClosed : P.equilibriumCondition
  ptFlashSolverClosed : P.ptFlashSolver

def PhaseEquilibriumClosed (P : PhaseEquilibriumPackage) : Prop :=
  P.vaporLiquidEquilibrium ∧ P.activityCoefficientModel ∧
  P.fugacityCoefficientModel ∧ P.equilibriumCondition ∧ P.ptFlashSolver

theorem phase_equilibrium_closed_from_evidence (P : PhaseEquilibriumPackage) (E : PhaseEquilibriumEvidence P) :
  PhaseEquilibriumClosed P := by
  exact And.intro E.vaporLiquidEquilibriumClosed
    (And.intro E.activityCoefficientModelClosed
      (And.intro E.fugacityCoefficientModelClosed
        (And.intro E.equilibriumConditionClosed E.ptFlashSolverClosed)))

end ChemicalEngineeringSeparationProcesses
end HautevilleHouse