import '../../domain/ong_document_entity.dart';

class OngDocumentModel extends OngDocumentEntity {
  const OngDocumentModel({
    super.id,
    super.userId,
    super.ongId,
    super.statutesConstitutiveAct,
    super.declarationGoodStanding,
    super.minutesConstitutiveAssembly,
    super.publicDeed,
    super.registrationCertificate,
    super.nif,
    super.biRepresentative,
    super.status,
    super.createdAt,
    super.updatedAt,
  });

  factory OngDocumentModel.fromMap(Map<String, dynamic> map) {
    return OngDocumentModel(
      id: map['id'],
      userId: map['userId'],
      ongId: map['ongId'],
      statutesConstitutiveAct: map['statutesConstitutiveAct'],
      declarationGoodStanding: map['declarationGoodStanding'],
      minutesConstitutiveAssembly: map['minutesConstitutiveAssembly'],
      publicDeed: map['publicDeed'],
      registrationCertificate: map['registrationCertificate'],
      nif: map['nif'],
      biRepresentative: map['biRepresentative'],
      status: map['status'] ?? 'pending',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
