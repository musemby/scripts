import copy
from sil_edi.beneficiaries.models import *
from sil_edi.claims.models import *
from tests.beneficiaries.utils import test_beneficiary_data


bref = Beneficiary.objects.first()
ben_fields = {
    "first_name": "Joseph",
    "last_name": "Musembi",
    "updated_by": bref.updated_by,
    "created_by": bref.created_by,
    "payer_slade_code": bref.payer_slade_code,
    "owner": bref.owner,
    "beneficiary_code": "SumCode"
}

ben, created = Beneficiary.objects.get_or_create(**ben_fields)

bd_fields = {
    "beneficiary_id": ben.id,
    "data": test_beneficiary_data(),
    "updated_by": bref.updated_by,
    "created_by": bref.created_by,
    "owner": bref.owner
}

ref_claim = Claim.objects.first()

cline_data = {
    "claim": ref_claim,
    "unit_price": 200,
    "quantity":10,
    "name": "Jiina",
    "updated_by": ref_claim.updated_by,
    "created_by": ref_claim.created_by,
    "owner": ref_claim.owner
}

cline = ClaimLine.objects.create(**cline_data)
# import pdb; pdb.set_trace()

# ben_data, created = BeneficiaryData.objects.create(**bd_fields)
# bd2fs = copy.deepcopy(bd_fields)
# bd2fs['data']['title'] = "Mr"

# ben_data2, created = BeneficiaryData.objects.get_or_create(**bd2fs)
# bd3fs = copy.deepcopy(bd_fields)
# bd3fs['data']['title'] = "Miss"

# ben_data3, created = BeneficiaryData.objects.get_or_create(**bd3fs)
# bd4fs = copy.deepcopy(bd_fields)
# bd4fs['data']['title'] = None
# ben_data4, created = BeneficiaryData.objects.get_or_create(**bd4fs)
# print(ben_data4.id)
# print(ben_data4.data)
