module B2cHelper

  def camere(nr_camere)
    if nr_camere == 1
      return "Camera"
    else
      return "Camere"
    end
  end

  def pret(pret_vanzare, pret_inchiriere)
    if pret_vanzare && pret_vanzare > 0
      return pret_vanzare
    else
      return pret_inchiriere
    end
  end

  def pret_per(moneda, pret_per)
    if moneda && (pret_per.nil? || pret_per.blank?)
      return moneda
    else
      return moneda + " / " + pret_per
    end
  end

  def dormitoare(dormitoare)
    if dormitoare == 1
      return "Dormitor"
    else
      return "Dormitoare"
    end
  end

  def bai(bai)
    if bai == 1
      return "Baie"
    else
      return "Bai"
    end
  end

end
