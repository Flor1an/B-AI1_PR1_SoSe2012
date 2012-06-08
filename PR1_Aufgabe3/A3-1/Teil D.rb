# Skalarprodukt: http://www.youtube.com/watch?v=yBvcXfceGkw
# Matrix mal Spaltenvektor: http://teacher.eduhi.at/ds/mathematik/matrizen.htm
# http://www.ucl.ac.uk/Mathematics/geomath/level2/mat/mat21.html

# Matrix mal Matrix: http://www.youtube.com/watch?v=aaZekvIXczc
class Matrix
  
  
  
  # n = Reihe, m = Spalte
  def initialize(n=3, m=3)
    @matrix = []
    n.times{|i|
      @matrix[i] = []
      m.times{
        @matrix[i] << rand(0...9)
      }
    }
    
   @matrix = [ [1,2,3], [4,5,6], [7,8,9] ]
  end

  
  
  
  # Multiplikation mit einem Vektor:
  # Skalarprodukt einer nxm Matrix mit einem Spaltenvektor der Länge m.
  # Das Ergebnis ist ein Vektor der Länge n
  def multipliziere_mit_vektor(vektor)

    p "Matrix: #{@matrix}"
    p "Vektor: #{vektor}"

    vektorN = []
    @matrix.each_with_index{|rowElm, rowInx|
      sum = 0
      p "#{rowElm} * #{vektor}"
      rowElm.each_with_index{|colElm, colInx|
        p "#{colElm} * #{vektor[colInx]}"
        sum += (colElm * vektor[colInx])
      }
      p sum
      vektorN << sum
    }
    p "Neuer Vektor: #{vektorN}"
    return vektorN
  end

  
  
  
  # Matrixmultiplikation:
  # Multipliziert eine nxm Matrix mit eine mxk Matrix
  # das Ergebnis ist eine nxk Matrix
  # die Elemente in der nxk Matrix res[i][l] werden berechnet, indem
  # die Summe über die Produkte a[i][j]*b[j][l] für j = 0 .. m-1 gebildet wird
  def multipliziere_mit_matrix(other_matrix)
    
    p "Matrix: #{@matrix}"
    p "Multipizieren: #{other_matrix}"
    
    # Neue Matrix aufbauen
    matrixN = []
    n = @matrix.length;
    k = other_matrix[0].length
    n.times{
      row = []
      k.times{
        row << []
      }
      matrixN << row
    }
    p matrixN
    
    # Neue Maxtrix füllen
    matrixN.each_with_index{|rowElement, rowIndex|
 
      rowElement.each_with_index{|columnElement, columnIndex|
        
        puts "\n"
        p "#{rowIndex} : #{columnIndex}"
       
       sum = 0
       test = []
       @matrix[rowIndex].each_with_index{|e,i|
         test << "(#{e} * #{other_matrix[i][columnIndex]})"
         sum += e * other_matrix[i][columnIndex]
         }
        
         p test.join(' + ')
         matrixN[rowIndex][columnIndex] = sum
       
      }
    }
    
    puts "\nErgebnis"
    p matrixN
  end

  
  
  
  
  # transponiert diese (nxm) Matrix und erzeugt eine
  # neue (mxn) Matrix m2.
  # Es gilt, dass m2[j][i] == diese_matrix[i][j]
  def transponiere_matrix()
    matrixT = []
    @matrix.each_with_index{|rowElm, rowInx|
      rowElm.each_with_index{|colElm, colInx|
        matrixT[colInx] = matrixT[colInx] ? matrixT[colInx] : []
        matrixT[colInx] << colElm
      }
    }
    
    p @matrix
    p matrixT
    return matrixT
  end

  
  
  
  # transponiert eine (nxn) Matrix, indem es die Inhalte
  # der Matrix tauscht
  def transponiere_matrix!()
    return @matrix = transponiere_matrix()
  end

  
  
  
  # Ausgabe auf der Konsole
  def formatiert_ausgeben(vektor=nil)
    vektor = vektor ? vektor : @matrix
    vektor.each{|rowElm|
      rowElm.each{|colElm|
        print "#{colElm}\t"
      }
    puts
    }
  end
end

inst = Matrix.new()
#inst.multipliziere_mit_vektor([1,2,3])

inst.multipliziere_mit_matrix([ [1,0,0,1], [0,3,0,0], [2,4,0,0] ])
exit
inst.transponiere_matrix!()
inst.formatiert_ausgeben()
  
  
  