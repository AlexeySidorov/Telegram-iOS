import Foundation
import Postbox
import TelegramApi

import SyncCore

extension ExportedInvitation {
    init?(apiExportedInvite: Api.ExportedChatInvite) {
        switch apiExportedInvite {
            case .chatInviteEmpty:
                return nil
            case let .chatInviteExported(flags, link, adminId, date, expireDate, usageLimit, usage):
                self = ExportedInvitation(link: link, isPermanent: (flags & (1 << 5)) != 0, isRevoked: (flags & (1 << 0)) != 0, adminId: PeerId(namespace: Namespaces.Peer.CloudUser, id: adminId), date: date, expireDate: expireDate, usageLimit: usageLimit, count: usage)
        }
    }
}
