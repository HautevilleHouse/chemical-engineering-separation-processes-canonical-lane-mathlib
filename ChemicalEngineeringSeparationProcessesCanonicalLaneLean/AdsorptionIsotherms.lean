import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesCanonicalLaneLean

structure AdsorptionIsothermPackage where
  isothermType : String
  adsorptionConstant : ℝ
  maximumCapacity : ℝ
  loadingExpression : ℝ → ℝ
  langmuirModel : Prop
  freundlichModel : Prop
  competitiveAdsorption : Prop

structure AdsorptionIsothermEvidence (A : AdsorptionIsothermPackage) where
  langmuirModelClosed : A.langmuirModel
  freundlichModelClosed : A.freundlichModel
  competitiveAdsorptionClosed : A.competitiveAdsorption

def AdsorptionIsothermClosed (A : AdsorptionIsothermPackage) : Prop :=
  A.langmuirModel ∧ A.freundlichModel ∧ A.competitiveAdsorption

theorem adsorption_isotherm_closed_from_evidence
    (A : AdsorptionIsothermPackage) (E : AdsorptionIsothermEvidence A) :
    AdsorptionIsothermClosed A := by
  exact And.intro E.langmuirModelClosed (And.intro E.freundlichModelClosed E.competitiveAdsorptionClosed)

end ChemicalEngineeringSeparationProcessesCanonicalLaneLean
end HautevilleHouse
