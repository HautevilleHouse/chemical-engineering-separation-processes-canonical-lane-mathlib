import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcesses

structure MassTransferPackage where
  diffusionModel : Type u
  filmTheory : Prop
  penetrationTheory : Prop
  massTransferCoefficient : Type v
  interphaseTransport : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  diffusionModelClosed : M.diffusionModel
  filmTheoryClosed : M.filmTheory
  penetrationTheoryClosed : M.penetrationTheory
  massTransferCoefficientClosed : M.massTransferCoefficient
  interphaseTransportClosed : M.interphaseTransport

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.diffusionModel ∧ M.filmTheory ∧ M.penetrationTheory ∧
  M.massTransferCoefficient ∧ M.interphaseTransport

theorem mass_transfer_closed_from_evidence (M : MassTransferPackage) (E : MassTransferEvidence M) :
  MassTransferClosed M := by
  exact And.intro E.diffusionModelClosed
    (And.intro E.filmTheoryClosed
      (And.intro E.penetrationTheoryClosed
        (And.intro E.massTransferCoefficientClosed E.interphaseTransportClosed)))

end ChemicalEngineeringSeparationProcesses
end HautevilleHouse