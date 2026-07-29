import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure MassTransferKineticsPackage where
  diffusivity : ℝ → ℝ
  filmThickness : ℝ
  massTransferCoefficient : ℝ → ℝ
  fluxExpression : ℝ → ℝ
  drivingForceModel : Prop
  resistanceAdditivity : Prop

structure MassTransferKineticsEvidence (M : MassTransferKineticsPackage) where
  drivingForceModelClosed : M.drivingForceModel
  resistanceAdditivityClosed : M.resistanceAdditivity

def MassTransferKineticsClosed (M : MassTransferKineticsPackage) : Prop :=
  M.drivingForceModel ∧ M.resistanceAdditivity

theorem mass_transfer_kinetics_closed_from_evidence
    (M : MassTransferKineticsPackage) (E : MassTransferKineticsEvidence M) :
    MassTransferKineticsClosed M := by
  exact And.intro E.drivingForceModelClosed E.resistanceAdditivityClosed

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
