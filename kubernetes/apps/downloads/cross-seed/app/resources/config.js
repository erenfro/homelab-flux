module.exports = {
  delay: 20,
  qbittorrentUrl: "http://qbittorrent.downloads.svc.cluster.local",
  torznab: [
    `http://prowlarr.default.svc.cluster.local/5/api?apikey=${process.env.PROWLARR_API_KEY}`, // ipt
    `http://prowlarr.default.svc.cluster.local/39/api?apikey=${process.env.PROWLARR_API_KEY}`,  // fl
    `http://prowlarr.default.svc.cluster.local/40/api?apikey=${process.env.PROWLARR_API_KEY}`, // ant
    `http://prowlarr.default.svc.cluster.local/41/api?apikey=${process.env.PROWLARR_API_KEY}`, // ar
  ],
  port: process.env.CROSSSEED_PORT || 80,
  apiAuth: false,
  action: "inject",
  includeEpisodes: false,
  includeSingleEpisodes: true,
  includeNonVideos: true,
  duplicateCategories: true,
  matchMode: "safe",
  skipRecheck: true,
  linkType: "hardlink",
  linkDir: "/media/downloads/torrent/complete/cross-seed",
  dataDirs: [
    "/media/downloads/torrent/complete/prowlarr",
    "/media/downloads/torrent/complete/movies",
    "/media/downloads/torrent/complete/tv",
  ],
  maxDataDepth: 1,
  outputDir: "/config/xseeds",
  torrentDir: "/config/qBittorrent/BT_backup",
};
