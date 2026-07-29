import ChemicalEngineeringSeparationProcessesCanonicalLaneLean.FilmTheory

/-!
# Mass Transfer Models Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure MassTransferModelsPackage {F : FilmTheoryPackage} (D : DiffusionPackage F) where
  fluxEquationConvective : Prop
  fluxEquationDiffusive : Prop
  continuityAcrossInterface : Prop
  enhancementFactorModeled : Prop

structure MassTransferModelsEvidence {F : FilmTheoryPackage}
    {D : DiffusionPackage F} (M : MassTransferModelsPackage D) where
  fluxEquationConvectiveClosed : M.fluxEquationConvective
  fluxEquationDiffusiveClosed : M.fluxEquationDiffusive
  continuityAcrossInterfaceClosed : M.continuityAcrossInterface
  enhancementFactorModeledClosed : M.enhancementFactorModeled

def MassTransferModelsClosed {F : FilmTheoryPackage}
    {D : DiffusionPackage F} (M : MassTransferModelsPackage D) : Prop :=
  M.fluxEquationConvective ∧ M.fluxEquationDiffusive ∧
  M.continuityAcrossInterface ∧ M.enhancementFactorModeled

theorem mass_transfer_models_closed_from_evidence
    {F : FilmTheoryPackage} {D : DiffusionPackage F}
    (M : MassTransferModelsPackage D) (Ev : MassTransferModelsEvidence M) :
    MassTransferModelsClosed M := by
  exact And.intro Ev.fluxEquationConvectiveClosed
    (And.intro Ev.fluxEquationDiffusiveClosed
      (And.intro Ev.continuityAcrossInterfaceClosed Ev.enhancementFactorModeledClosed))

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse