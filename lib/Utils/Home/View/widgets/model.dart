import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {

  final int? id;
  final String? srNo;
  final String? customer;
  final String? address;
  final String? period;
  final String? type;
  final String? month;
  final DateTime? visitDate;
  final DateTime? date;
  final String? contactDetails;
  final String? driveType;
  final String? product2;
  final int? pn;
  final int? sn;
  final int? csc;
  final String? unitSupply;
  final String? machineType;
  final String? lastUpdate;
  final String? buyerName;
  final String? customerComplain1;
  final int? customerComplain2;
  final String? observation1;
  final String? observation2;
  final String? problem;
  final int? actionTaken;
  final String? pendingAction;
  final String? engineerName;
  final String? serviceTo;
  final String? code;
  final String? partsUsedService;
  final String? partOrderingNo;
  final String? faultyPartSrNo;
  final String? replacedPartSrNo;
  final String? parts1;
  final String? ord1;
  final String? faulty1;
  final String? replaced1;
  final String? parts2;
  final String? ord2;
  final String? faulty2;
  final String? replaced2;
  final String? parts3;
  final String? ord3;
  final String? faulty3;
  final String? replaced3;
  final String? parts4;
  final String? ord4;
  final String? faulty4;
  final String? replaced4;
  final String? sp1;
  final String? sp2;
  final String? sp3;
  final String? sp4;
  final String? sp5;
  final int? charges;
  final int? travelling;
  final int? auto;
  final int? boarding;
  final int? material;
  final int? courier;
  final int? act;
  final int? allowance;
  final int? nosEr;
  final int? total;
  final String? grandTotal;
  final String? confirmTotal;

  ReportModel({
    this.id,
    this.srNo,
    this.customer,
    this.address,
    this.period,
    this.type,
    this.month,
    this.visitDate,
    this.date,
    this.contactDetails,
    this.driveType,
    this.product2,
    this.pn,
    this.sn,
    this.csc,
    this.unitSupply,
    this.machineType,
    this.lastUpdate,
    this.buyerName,
    this.customerComplain1,
    this.customerComplain2,
    this.observation1,
    this.observation2,
    this.problem,
    this.actionTaken,
    this.pendingAction,
    this.engineerName,
    this.serviceTo,
    this.code,
    this.partsUsedService,
    this.partOrderingNo,
    this.faultyPartSrNo,
    this.replacedPartSrNo,
    this.parts1,
    this.ord1,
    this.faulty1,
    this.replaced1,
    this.parts2,
    this.ord2,
    this.faulty2,
    this.replaced2,
    this.parts3,
    this.ord3,
    this.faulty3,
    this.replaced3,
    this.parts4,
    this.ord4,
    this.faulty4,
    this.replaced4,
    this.sp1,
    this.sp2,
    this.sp3,
    this.sp4,
    this.sp5,
    this.charges,
    this.travelling,
    this.auto,
    this.boarding,
    this.material,
    this.courier,
    this.act,
    this.allowance,
    this.nosEr,
    this.total,
    this.grandTotal,
    this.confirmTotal,
  });
  
  // Add a factory constructor to create a ReportModel from a Firestore document
  factory ReportModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ReportModel(
      id: data['id'],
      srNo: data['srNo'],
      customer: data['customer'],
      address: data['address'],
      period: data['period'],
      type: data['type'],
      month: data['month'],
      visitDate: data['visitDate'] != null ? (data['visitDate'] as Timestamp).toDate() : null,
      date: data['date'] != null ? (data['date'] as Timestamp).toDate() : null,
      contactDetails: data['contactDetails'],
      driveType: data['driveType'],
      product2: data['product2'],
      pn: data['pn'],
      sn: data['sn'],
      csc: data['csc'],
      unitSupply: data['unitSupply'],
      machineType: data['machineType'],
      lastUpdate: data['lastUpdate'],
      buyerName: data['buyerName'],
      customerComplain1: data['customerComplain1'],
      customerComplain2: data['customerComplain2'],
      observation1: data['observation1'],
      observation2: data['observation2'],
      problem: data['problem'],
      actionTaken: data['actionTaken'],
      pendingAction: data['pendingAction'],
      engineerName: data['engineerName'],
      serviceTo: data['serviceTo'],
      code: data['code'],
      partsUsedService: data['partsUsedService'],
      partOrderingNo: data['partOrderingNo'],
      faultyPartSrNo: data['faultyPartSrNo'],
      replacedPartSrNo: data['replacedPartSrNo'],
      parts1: data['parts1'],
      ord1: data['ord1'],
      faulty1: data['faulty1'],
      replaced1: data['replaced1'],
      parts2: data['parts2'],
      ord2: data['ord2'],
      faulty2: data['faulty2'],
      replaced2: data['replaced2'],
      parts3: data['parts3'],
      ord3: data['ord3'],
      faulty3: data['faulty3'],
      replaced3: data['replaced3'],
      parts4: data['parts4'],
      ord4: data['ord4'],
      faulty4: data['faulty4'],
      replaced4: data['replaced4'],
      sp1: data['sp1'],
      sp2: data['sp2'],
      sp3: data['sp3'],
      sp4: data['sp4'],
      sp5: data['sp5'],
      charges: data['charges'],
      travelling: data['travelling'],
      auto: data['auto'],
      boarding: data['boarding'],
      material: data['material'],
      courier: data['courier'],
      act: data['act'],
      allowance: data['allowance'],
      nosEr: data['nosEr'],
      total: data['total'],
      grandTotal: data['grandTotal'],
      confirmTotal: data['confirmTotal'],
    );
  }
}