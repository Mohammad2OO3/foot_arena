class NotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final bool? isRead;
  final int? orderId;
  final String? serviceName;
  final String? type;
  final DateTime? createdAt;


  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.orderId,
    this.serviceName,
    this.createdAt,
    this.type,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    bool? isRead,
    int? orderId,
    String? serviceName,
    String? type,
    DateTime? createdAt,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        isRead: isRead ?? this.isRead,
        orderId: orderId ?? this.orderId,
        serviceName: serviceName ?? this.serviceName,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    isRead: json["isRead"],
    orderId: json["orderId"],
    type: json["type"],
    serviceName: json["serviceName"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "isRead": isRead,
    "orderId": orderId,
    "type": type,
    "serviceName": serviceName,
    "createdAt": createdAt?.toIso8601String(),
  };
}

class Links {
  final dynamic first;
  final dynamic last;
  final dynamic prev;
  final dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links copyWith({
    dynamic first,
    dynamic last,
    dynamic prev,
    dynamic next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  final int? currentPage;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Meta copyWith({
    int? currentPage,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["currentPage"],
    firstPageUrl: json["firstPageUrl"],
    from: json["from"],
    lastPage: json["lastPage"],
    lastPageUrl: json["lastPageUrl"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["nextPageUrl"],
    path: json["path"],
    perPage: json["perPage"],
    prevPageUrl: json["prevPageUrl"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "firstPageUrl": firstPageUrl,
    "from": from,
    "lastPage": lastPage,
    "lastPageUrl": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "nextPageUrl": nextPageUrl,
    "path": path,
    "perPage": perPage,
    "prevPageUrl": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Link {
  final String? url;
  final String? label;
  final int? page;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.page,
    this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    int? page,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        page: page ?? this.page,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    page: json["page"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "page": page,
    "active": active,
  };
}