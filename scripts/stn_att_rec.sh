CUDA_VISIBLE_DEVICES=0 python -u main.py \
  --synthetic_train_data_dir data/train_folder/ \
  --test_data_dir data/test_folder/ \
  --batch_size 256 \
  --workers 0 \
  --height 64 \
  --width 256 \
  --voc_type ALLCASES_SYMBOLS \
  --arch ResNet_ASTER \
  --with_lstm \
  --logs_dir logs/baseline_aster \
  --real_logs_dir /data/mkyang/logs/recognition/aster.pytorch \
  --max_len 125 \
  --STN_ON \
  --tps_inputsize 32 64 \
  --tps_outputsize 32 100 \
  --tps_margins 0.05 0.05 \
  --stn_activation none \
  --num_control_points 20 \
  --resume logs/baseline_aster/checkpoint.pth.tar \
  --print_freq 2 \
  --epochs 20