import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SufficiencyPackage (A : AdmissibleClass) where
  sufficientStatistic : (Set A.object.sampleSpace) → Set A.object.parameterSpace
  factorization : Prop
  factorizationProof : factorization

structure SufficiencyEvidence (A : AdmissibleClass) (S : SufficiencyPackage A) where
  factorizationClosed : S.factorization

def SufficiencyClosed (A : AdmissibleClass) (S : SufficiencyPackage A) : Prop :=
  S.factorization

theorem sufficiency_closed_from_evidence (A : AdmissibleClass) (S : SufficiencyPackage A)
    (E : SufficiencyEvidence A S) : SufficiencyClosed A S := by
  exact E.factorizationClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse