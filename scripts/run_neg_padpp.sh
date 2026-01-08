use_gpi=1
NEPOCHS=50
EXPNAME="Main"
npres=64
for i in 1 2 3
do
    # model training
    CUDA_VISIBLE_DEVICES=7 accelerate launch --main_process_port 2020 --gpu_ids 7 --num_processes 1 run.py  \
        --exp_name $EXPNAME \
        --project_name MODPL \
        --seed $i \
        --scenario negotiation \
        --log_dir logs \
        --loggers terminal,file \
        --datasets craigslist_bargain \
        --models padpp \
        --prioritized_objective uniform \
        --gen_models llama3 \
        --model_type llama3 \
        --num_train_rl_epochs $NEPOCHS \
        --n_preferences $npres \
        --use_gpi $use_gpi \
        --metrics acc,prf1,sr,sl_ratio,fairness,deal_rate,avg_turn    

    # model evaluation for price grain
    CUDA_VISIBLE_DEVICES=7 accelerate launch --main_process_port 2020 --gpu_ids 7 --num_processes 1 run.py  \
        --exp_name $EXPNAME \
        --project_name MODPL \
        --seed $i \
        --scenario negotiation \
        --log_dir logs \
        --loggers terminal,file \
        --datasets craigslist_bargain \
        --models padpp \
        --test_phase \
        --prioritized_objective sl_ratio \
        --gen_models llama3 \
        --model_type llama3 \
        --metrics acc,prf1,sr,sl_ratio,fairness,deal_rate,avg_turn    

    # model evaluation for fairness
    CUDA_VISIBLE_DEVICES=7 accelerate launch --main_process_port 2020 --gpu_ids 7 --num_processes 1 run.py  \
        --exp_name $EXPNAME \
        --project_name MODPL \
        --seed $i \
        --scenario negotiation \
        --log_dir logs \
        --loggers terminal,file \
        --datasets craigslist_bargain \
        --models padpp \
        --test_phase \
        --prioritized_objective fairness \
        --gen_models llama3 \
        --model_type llama3 \
        --metrics acc,prf1,sr,sl_ratio,fairness,deal_rate,avg_turn    

    # model evaluation for deal rate
    CUDA_VISIBLE_DEVICES=7 accelerate launch --main_process_port 2020 --gpu_ids 7 --num_processes 1 run.py  \
        --exp_name $EXPNAME \
        --project_name MODPL \
        --seed $i \
        --scenario negotiation \
        --log_dir logs \
        --loggers terminal,file \
        --datasets craigslist_bargain \
        --models padpp \
        --test_phase \
        --prioritized_objective deal_rate \
        --gen_models llama3 \
        --model_type llama3 \
        --metrics acc,prf1,sr,sl_ratio,fairness,deal_rate,avg_turn    
done
