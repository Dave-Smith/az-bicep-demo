@echo off

az group create --name rg-bicep-tutorial --location eastus

az storage account create --name stgbiceuptutorial --resource-group rg-bicep-tutorial --kind StorageV2 --access-tier hot --https-only true
