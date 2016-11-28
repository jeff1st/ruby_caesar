def stock_picker(data)
    max = 0
    best_buy = 0
    best_sell = 0

    (0..data.length-2).each do |buy_day|
        (buy_day+1..data.length-1).each do |sell_day|
            if (data[sell_day] - data[buy_day]) > max
                max = (data[sell_day] - data[buy_day])
                best_buy = buy_day
                best_sell = sell_day
            end
        end
    end
    results = [best_buy, best_sell]
    return results
end
