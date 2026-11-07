{ pkgs, lib, config, ... }:
{
    imports = [ ./common.nix ];

    home.username = "maciej";
    home.homeDirectory = "/Users/maciej";
    home.stateVersion = "24.05";

    home.packages = [
        pkgs.pinentry_mac
        pkgs.duti
    ];

    # Personal scripts live in dot_files/bin; link them into ~/.local/bin.
    # (Out-of-store symlink: edits to the script apply without a rebuild.)
    home.file.".local/bin/mount_share".source =
        config.lib.file.mkOutOfStoreSymlink
            "${config.home.homeDirectory}/.local/share/dot_files/bin/mount_share";

    targets.darwin.linkApps.enable = false;
    targets.darwin.copyApps.enable = true;

    # make mpv the default handler
    home.activation.setMpvAsDefaultVideoPlayer = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        videoUtis=(
            com.adobe.flash.video
            com.apple.m4v-video
            com.apple.quicktime-movie
            com.microsoft.advanced-systems-format
            com.mythtv.nuv
            com.real.realmedia
            io.mpv.divx
            io.mpv.h263
            io.mpv.h264
            io.mpv.hevc
            io.mpv.mk3d
            io.mpv.mts
            io.mpv.nsv
            io.mpv.vcd
            io.mpv.vob
            io.mpv.webm
            io.mpv.wmv
            io.mpv.xvid
            io.mpv.y4m
            io.mpv.yuv
            org.matroska.mkv
            org.webmproject.webm
            org.xiph.ogg-video
            public.3gpp2
            public.3gpp
            public.avi
            public.dv-movie
            public.flc-animation
            public.movie
            public.mpeg-2-video
            public.mpeg-4
            public.mpeg
            public.video
        )
        for uti in "''${videoUtis[@]}"; do
            run ${pkgs.duti}/bin/duti -s io.mpv "$uti" all
        done
    '';
}
