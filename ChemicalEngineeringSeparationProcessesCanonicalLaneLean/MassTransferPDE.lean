import HautevilleHouse.ChemicalEngineeringSeparationProcessesCanonicalLaneLean.DistillationColumnModel

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure MassTransferPDEModel (D : DistillationColumnModel) where
  convectionTerm : Prop
  diffusionTerm : Prop
  interfacialMassTransfer : Prop
  boundaryLayerModel : Prop
  transientBehavior : Prop

structure MassTransferPDEEvidence {D : DistillationColumnModel}
    (M : MassTransferPDEModel D) where
  convectionTermClosed : M.convectionTerm
  diffusionTermClosed : M.diffusionTerm
  interfacialMassTransferClosed : M.interfacialMassTransfer
  boundaryLayerModelClosed : M.boundaryLayerModel
  transientBehaviorClosed : M.transientBehavior

def MassTransferPDEClosed {D : DistillationColumnModel} (M : MassTransferPDEModel D) : Prop :=
  M.convectionTerm ∧ M.diffusionTerm ∧ M.interfacialMassTransfer ∧
  M.boundaryLayerModel ∧ M.transientBehavior

theorem mass_transfer_pde_closed_from_evidence {D : DistillationColumnModel}
    (M : MassTransferPDEModel D) (E : MassTransferPDEEvidence M) :
    MassTransferPDEClosed M := by
  exact And.intro E.convectionTermClosed
    (And.intro E.diffusionTermClosed
      (And.intro E.interfacialMassTransferClosed
        (And.intro E.boundaryLayerModelClosed E.transientBehaviorClosed)))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse