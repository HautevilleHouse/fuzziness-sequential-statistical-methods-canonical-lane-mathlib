import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure FuzzySufficiencyPackage where
  observable : Type u
  fuzzyStatistic : Type v
  fuzzySufficiencyCondition : Prop
  fisherInformationFactorization : Prop
  fuzzySufficiencyEvidence : fuzzySufficiencyCondition
  factorizationEvidence : fisherInformationFactorization

structure FuzzySufficiencyEvidence (F : FuzzySufficiencyPackage) where
  fuzzySufficiencyClosed : F.fuzzySufficiencyCondition
  factorizationClosed : F.fisherInformationFactorization

def FuzzySufficiencyClosed (F : FuzzySufficiencyPackage) : Prop :=
  F.fuzzySufficiencyCondition ∧ F.fisherInformationFactorization

theorem fuzzy_sufficiency_closed_from_evidence
    (F : FuzzySufficiencyPackage) (E : FuzzySufficiencyEvidence F) :
    FuzzySufficiencyClosed F := by
  exact And.intro E.fuzzySufficiencyClosed E.factorizationClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse