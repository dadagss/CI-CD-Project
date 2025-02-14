output "service_url" {
  description = "URL do serviço no AppRunner"
  value       = aws_apprunner_service.app.service_url
}