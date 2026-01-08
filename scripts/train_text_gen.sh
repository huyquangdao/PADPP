#
#export CUDA_VISIBLE_DEVICES=5
#
#CUDA_VISIBLE_DEVICES=5 accelerate launch --gpu_ids 5 train_text_gen.py \
#    --project_name MODPL \
#    --seed 3 \
#    --scenario recommendation \
#    --log_dir logs \
#    --loggers terminal,file \
#    --models bart_gen \
#    --datasets durecdial \
#    --metrics dist_n,rouge_n,bleu_n
#


export CUDA_VISIBLE_DEVICES=4

CUDA_VISIBLE_DEVICES=4 accelerate launch --gpu_ids 4 train_text_gen.py \
    --project_name MODPL \
    --seed 3 \
    --scenario negotiation \
    --log_dir logs \
    --loggers terminal,file \
    --models bart_gen \
    --datasets craigslist_bargain \
    --metrics dist_n,rouge_n,bleu_n



#export CUDA_VISIBLE_DEVICES=5
#
#CUDA_VISIBLE_DEVICES=5 accelerate launch --gpu_ids 5 train_text_gen.py \
#    --project_name MODPL \
#    --seed 3 \
#    --scenario emotional_support \
#    --log_dir logs \
#    --loggers terminal \
#    --models bart_gen \
#    --datasets es_conv \
#    --metrics dist_n,rouge_n,bleu_n