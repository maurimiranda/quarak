json.array!(@balances) do |balance|
  json.user do
    json.id balance.user.id
    json.name balance.user.name
  end
  json.extract! balance, :expenses, :payments, :credits, :debits, :balance
end