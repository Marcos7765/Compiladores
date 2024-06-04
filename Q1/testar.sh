#se estiver impaciente ou em dúvida se roda, mude TENTATIVAS
#PARÂMETROS
TENTATIVAS=3
ARQUIVOS="a b c d"

#VARIÁVEIS
RECORDE="X"
CANDIDATO=""
CONTADOR=0

PATHTESTE=../Q1/testar.sh

#se você conseguir um falso positivo nesse teste você fez por onde
if [ ! -f "$PATHTESTE" ]; then
    echo "Execute este script a partir de sua pasta de origem."
    exit 0
fi

echo "Sem otimização, resultados ($TENTATIVAS tentativas): "
for ARQUIVO in $ARQUIVOS; do
    gcc ${ARQUIVO}.c -o ${ARQUIVO}.out
    CONTADOR=0
    RECORDE="X"
    while [ $CONTADOR -lt $TENTATIVAS ]; do        
        CANDIDATO=$( { time -f %E ./${ARQUIVO}.out; } 2>&1 )
        #comparando por ordem alfabetica porque, a menos que o programa demore 10min ou mais, não faz diferença
        #e eu não quero converter pra número msm (o . é menor que números tb caso duvide)
        COMPARACAO="BEGIN{ if ( \"${CANDIDATO}\" < \"${RECORDE}\" ) print \"1\"}"
        if [ "$(awk "$COMPARACAO")"  = "1" ]; then
            RECORDE=$CANDIDATO
        fi
        CONTADOR=$(($CONTADOR + 1))
    done
    echo "Tempo récorde $ARQUIVO.c: $RECORDE"
done

echo "Otimização O2, resultados ($TENTATIVAS tentativas): "
for ARQUIVO in $ARQUIVOS; do
    gcc -O2 ${ARQUIVO}.c -o ${ARQUIVO}.out
    CONTADOR=0
    RECORDE="X"
    while [ $CONTADOR -lt $TENTATIVAS ]; do        
        CANDIDATO=$( { time -f %E ./${ARQUIVO}.out; } 2>&1 )
        #comparando por ordem alfabetica porque, a menos que o programa demore 10min ou mais, não faz diferença
        #e eu não quero converter pra número msm (o . é menor que números tb caso duvide)
        COMPARACAO="BEGIN{ if ( \"${CANDIDATO}\" < \"${RECORDE}\" ) print \"1\"}"
        if [ "$(awk "$COMPARACAO")"  = "1" ]; then
            RECORDE=$CANDIDATO
        fi
        CONTADOR=$(($CONTADOR + 1))
    done
    echo "Tempo récorde $ARQUIVO.c: $RECORDE"
done

rm *.out
