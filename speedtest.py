import torch
import torch.nn as nn
import torch.nn.functional as F
import timeit

from hfta.ops import convert_ops
from hfta.optim import get_hfta_optim_for


val_list = []
weight_list = []
bias_list = []
linear_list = []
iteration = 2

(hfta_Linear, ) = convert_ops(iteration, nn.Linear)
hfta_linear = hfta_Linear(16, 32, bias=True).to('cuda:0')
val_hfta = torch.randn(iteration, 19264, 16, device='cuda:0')
for i in range(iteration):
    val = torch.randn(19264, 16, device='cuda:0')
    # weight = torch.randn(32, 16, device='cuda:0')
    # bias = torch.randn(32, device='cuda:0')
    val_list.append(val)
    # weight_list.append(weight)
    # bias_list.append(bias)
    linear_nn = nn.Linear(16, 32, bias=True).to('cuda:0')
    linear_list.append(linear_nn)


s1 = torch.cuda.Stream()
s2 = torch.cuda.Stream()
start_time = timeit.default_timer()
torch.cuda.synchronize()
# hfta_linear(val_hfta)
for i in range(iteration):
    # with torch.cuda.stream(s1 if i % 2 == 0 else s2):
    #     torch.nn.functional.linear(val_list[i], weight_list[i], bias_list[i])
    # F.linear(val_list[i], weight_list[i], bias_list[i])
    linear_list[i](val_list[i])
torch.cuda.synchronize()
end_time = timeit.default_timer()

print('F.linear: ', end_time - start_time)