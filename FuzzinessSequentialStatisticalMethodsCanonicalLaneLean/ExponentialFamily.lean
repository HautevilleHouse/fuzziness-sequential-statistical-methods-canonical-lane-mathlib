import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure ExponentialFamilyPackage (A : AdmissibleClass) where
  naturalParameter : A.object.parameterSpace → ℝ
  sufficientStatistic : (Set A.object.sampleSpace) → A.object.parameterSpace
  logNormalizer : ℝ → ℝ
  canonicalForm : Prop
  canonicalFormProof : canonicalForm

structure ExponentialFamilyEvidence (A : AdmissibleClass) (E : ExponentialFamilyPackage A) where
  canonicalFormClosed : E.canonicalForm

def ExponentialFamilyClosed (A : AdmissibleClass) (E : ExponentialFamilyPackage A) : Prop :=
  E.canonicalForm

theorem exponential_family_closed_from_evidence (A : AdmissibleClass) (E : ExponentialFamilyPackage A)
    (Ev : ExponentialFamilyEvidence A E) : ExponentialFamilyClosed A E := by
  exact Ev.canonicalFormClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse