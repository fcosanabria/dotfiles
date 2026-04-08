{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "Francisco Sanabria";
        userEmail = "fsanabria@fastmail.com";
    };
}