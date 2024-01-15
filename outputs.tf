output "data" {
  sensitive = true

  value = merge(
    {
      notes = data.bitwarden_item_secure_note.item.notes
    },

    merge([
      for field in data.bitwarden_item_secure_note.item.field :
      {
        "${field.name}" = field.hidden != "" ? sensitive(field.hidden) : field.text
      }
    ]...)
  )
}
