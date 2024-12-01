require "application_system_test_case"

class ProductosTest < ApplicationSystemTestCase
  setup do
    @producto = productos(:one)
  end

  test "visiting the index" do
    visit productos_url
    assert_selector "h1", text: "Productos"
  end

  test "should create producto" do
    visit productos_url
    click_on "New producto"

    fill_in "Category", with: @producto.category
    fill_in "Color", with: @producto.color
    fill_in "Date in stock", with: @producto.date_in_stock
    fill_in "Delete date", with: @producto.delete_date
    fill_in "Last update", with: @producto.last_update
    fill_in "Name", with: @producto.name
    fill_in "Size", with: @producto.size
    fill_in "Stock", with: @producto.stock
    fill_in "Unit price", with: @producto.unit_price
    click_on "Create Producto"

    assert_text "Producto was successfully created"
    click_on "Back"
  end

  test "should update Producto" do
    visit producto_url(@producto)
    click_on "Edit this producto", match: :first

    fill_in "Category", with: @producto.category
    fill_in "Color", with: @producto.color
    fill_in "Date in stock", with: @producto.date_in_stock.to_s
    fill_in "Delete date", with: @producto.delete_date.to_s
    fill_in "Last update", with: @producto.last_update.to_s
    fill_in "Name", with: @producto.name
    fill_in "Size", with: @producto.size
    fill_in "Stock", with: @producto.stock
    fill_in "Unit price", with: @producto.unit_price
    click_on "Update Producto"

    assert_text "Producto was successfully updated"
    click_on "Back"
  end

  test "should destroy Producto" do
    visit producto_url(@producto)
    click_on "Destroy this producto", match: :first

    assert_text "Producto was successfully destroyed"
  end
end
