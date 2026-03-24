class Producto < ApplicationRecord
  belongs_to :user
  has_many_attached :fotos

  enum :estado, {
    nuevo: 0,
    bueno: 1,
    aceptable: 2,
    desgastado: 3,
    reparacion: 4
  }

  validates :nombre, :descripcion, :precio_compra, :precio_venta,
            :estado, :categoria, presence: true
  validates :precio_compra, :precio_venta, numericality: { greater_than_or_equal_to: 0 }

  scope :buscar, ->(termino) {
    return all if termino.blank?
    sanitized = termino.gsub(/[^a-zA-Z0-9áéíóúñÁÉÍÓÚÑ\s]/, '').strip
    return all if sanitized.blank?
    quoted = sanitized.split.map { |t| "\"#{t}\"*" }.join(" ")
    where("id IN (SELECT rowid FROM productos_fts WHERE productos_fts MATCH ?)", quoted)
  }

  scope :por_categoria, ->(cat) { where(categoria: cat) if cat.present? }
  scope :por_estado, ->(est) { where(estado: est) if est.present? }
end
